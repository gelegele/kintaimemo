class CompareValidator < ActiveModel::EachValidator
	def validate_each(record, attribute, value)
		cmp = record.attributes[options[:compare_to]]
		case options[:type]
		when :greater_than
			record.errors.add(attribute, 'must be greator than the value.') unless value > cmp
		when :less_than
			record.errors.add(attribute, 'must be less than the value.') unless value < cmp
		when :equal
			record.errors.add(attribute, 'must equal to the value.') unless value == cmp
		else
			raise 'unknown type'
		end
	end
end