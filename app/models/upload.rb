class Upload < ActiveRecord::Base
  has_one :summary

  after_save :get_summary


  def get_summary
    content = Summarizer.fetch_summary(self.text)
    self.summary = Summary.new(text: content)
    if self.summary.valid?
      self.summary.save! and true
    else
      false
    end
  end
end
