ThinkingSphinx::Index.define :job, :with => :active_record do
  # fields
  indexes :title
  indexes :description
end