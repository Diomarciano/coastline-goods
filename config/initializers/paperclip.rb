Paperclip::Attachment.default_options[:url] = ':https://s3.console.aws.amazon.com/s3/buckets/coastline-goods/?region=us-east-1&tab=overview'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
Paperclip::Attachment.default_options[:s3_host_name] = 's3-us-east-1.amazonaws.com'