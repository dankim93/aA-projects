# require 'byebug'
class Array
  def my_each(&prc)
    for idx in 0..self.length - 1
      prc.call(self[idx])
    end

    self
  end

  def my_select(&prc)
    answer = []
    self.my_each { |num| answer << num if prc.call(num) }

    answer
  end

  def my_reject(&prc)
    answer = []
    self.my_each { |num| answer << num if !prc.call(num) }

    answer
  end

  def my_any?(&prc)
    self.my_each { |num| return true if prc.call(num) }
    false
  end

  def my_all?(&prc)
    self.my_each { |num| return false if !prc.call(num) }
    true
  end

  def my_flatten
    a = []
    self.each do |element|
      if element.is_a?(Array)
        a += element.my_flatten
      else
        a << element
      end
    end

    a
  end

  def my_zip(*multiple)
    a = Array.new(self.length) { [] }
    multiple = multiple.unshift(self)

    for idx in 0..self.length - 1
      for idx2 in 0..self.length - 1
          if !multiple[idx][idx2].nil?
            a[idx2] << multiple[idx][idx2]
          else
            a[idx2] << nil
          end

      end
    end

    a
  end

  def my_rotate(repeat = 1)
    x = self.dup
    if repeat > 0
      repeat.times { x.push(x.first).shift }
    else
      repeat = repeat * -1
      repeat.times { x.unshift(x.last).pop }
    end

    x
  end

  def my_join(between = "")
    answer = ""
    self.each_with_index do |el, idx|
      if between == ""
        answer << el
      elsif idx != self.length - 1
        answer << el
        answer << between
      else
        answer << el
      end
    end

    answer
  end

  def my_reverse
    answer = []
    self.each do |el|
      answer.unshift(el)
    end

    answer
  end

end

a = [ "a", "b", "c", "d" ]
p a.my_reverse
