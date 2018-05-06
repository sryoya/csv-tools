# 1000件以上あるCSVファイルからランダムで1000件抽出して更新する
require "csv"
file = '/Users/ryoyasekino/desktop/tmp_test_evidence/SERVICE_CUSTOMER.csv'
file_row_count = CSV.read(file).count
goal_count = file_row_count - 1000
puts goal_count
nums = []
while goal_count > 0 do
	num = [*1..1066].sample
	unless nums.include?(num)
		nums << num
		goal_count -= 1
	end
end
puts nums

table = CSV.table(file)
nums.each do |n|
	table.by_row!.delete(n)
end
File.write(file, table)