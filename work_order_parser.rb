#!/usr/bin/env ruby

require 'csv'
require 'optparse'

class WorkOrderParser

  attr_accessor :work_orders

  def initialize(tsv_file)
    @work_orders = CSV.read(tsv_file, col_sep: "\t", headers: true)
  end

  def print_table
    @work_orders.each do |row|
      p row
    end
  end

end


if __FILE__ == $0

  op = OptionParser.new do |opts|

    opts.banner = "Usage: #{$0} [options] TSV_FILE"

    opts.on('-h', '--help', 'Print help message') do
      puts opts
      exit
    end

  end

  op.parse!

  tsv_file = ARGV.pop

  if !tsv_file
    puts op
    raise "Please specify a file to process"
  end

  wop = WorkOrderParser.new(tsv_file)
  wop.print_table

end

