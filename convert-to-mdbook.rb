module HeaderUtil
  module_function

  def to_filename(str)
    name = str.split(' ')[1].split('.').take(3).join('_')
    "chapter_#{name}"
  end

  def to_anker(str)
    _h, number, *title_tokens = str.split(" ")
    key = title_tokens.join(" ")

    "#{number} #{key}".gsub(".", "").gsub(" ", "-").downcase
  end

  def header?(str)
    str.start_with?(/^\#+\s\d\./)
  end

  def header_for_page?(str)
    str.start_with?(/^\#{1,3}\s\d\./)
  end
end

class MdbookConverter
  def initialize(target_filename)
    @target_filename = target_filename
  end

  def run
    lines = File.read(@target_filename).each_line.map { |l| l[0..-2] }

    idx = find_next_header_index(lines, 0)
    sections = {}
    loop do
      next_idx = find_next_header_index(lines, idx + 1)

      title = lines[idx]
      selection = lines[idx...next_idx]
      sections[title] = selection

      idx = next_idx

      break if next_idx.nil?
    end

    linkable_headers = generate_linkable_headers(lines)

    File.write("src/SUMMARY.md", generate_summary(sections.keys))
    sections.each do |title, lines|
      mdname = HeaderUtil.to_filename(title)
      body = lines.map { |l|
        tl = replace_title_with_link(l, linkable_headers)
        inject_newline_after_list_title(tl)
      }.join("\n")
      File.write("src/#{mdname}.md", body)
    end
  end

  private

  def replace_title_with_link(line, linkable_headers)
    if line.match?(/[을를] 참조/) || # In text
       line.match?(/에서 설명/) || # In text
       line.match?(/^- [\w -?]+\s:\s/) # Chapter index
      new_line = line.clone
      linkable_headers.each do |k, v|
        if !new_line.match?(/\[.*?#{k}.*?\]/) # Inhibit nested link generation
          new_line.gsub!(k, "[#{k}](#{v})")
        else
          new_line
        end
      end
      new_line
    else
      line
    end
  end

  # Inject newline to be prettier on mdbook css.
  # Before:
  # - **xxxxx**
  #   hogehoge
  #
  # **xxxxx**
  # hogehoge
  #
  # After:
  # - **xxxxx**
  #
  #   hogehoge
  #
  # **xxxxx**
  #
  # hogehoge
  def inject_newline_after_list_title(line)
    if line.match?(/^\s*-\s\*\*/) || line.match?(/^\*\*/)
      line + "\n"
    else
      line
    end
  end

  def generate_linkable_headers(lines)
    target_lines = lines.select { |l| HeaderUtil.header?(l) }
    result = []

    target_lines.each do |l|
      _h, number, *title_tokens = l.split(" ")
      key = title_tokens.join(" ")
      filename = HeaderUtil.to_filename(l)

      if _h.size < 4
        result << [key, "#{filename}.html"]
      else
        anker = HeaderUtil.to_anker(l)
        result << [key, "#{filename}.html##{anker}"]
      end
    end

    result.sort_by { |(k, v)| -k.size }.to_h
  end

  def find_next_header_index(lines, start_idx)
    range = lines[start_idx..]
    idx = range.find_index { |l| HeaderUtil.header_for_page?(l) }
    if idx.nil?
      nil
    else
      idx + start_idx
    end
  end

  def generate_summary(titles)
    lines = []
    lines << "# Bash Reference Manual"
    lines << "[들어가기 전에](README.md)"

    titles.each do |title|
      words = title.split(" ")
      header = words.first.size
      indent = " " * (header - 1) * 2
      title_text = words[2..].join(" ")
      lines << %Q|#{indent}- [#{title_text}](#{HeaderUtil.to_filename(title)}.md)|
    end
    lines.join("\n")
  end
end

if ARGV.size != 1
  puts "Usage: convert-to-mdbook <src file>"
  exit 2
end

target_filename = ARGV.first

MdbookConverter.new(target_filename).run
