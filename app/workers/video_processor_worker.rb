# class VideoProcessorWorker
#   include Sidekiq::Worker
#   WEB_MP4_PRESET_ID = '1351620000000-100070'
#
#   def perform
#     transcoder = AWS::ElasticTranscoder::Client.new
#     transcoder.create_job(
#       pipeline_id: ENV['PIPELINE_ID'],
#       input: {
#         key: @tutorial.video.path,
#         frame_rate: 'auto',
#         resolution: 'auto',
#         aspect_ratio: 'auto',
#         interlaced: 'auto',
#         container: 'auto'
#       },
#       output: {
#         key: @tutorial.video.path,
#         preset_id: WEB_MP4_PRESET_ID,
#         thumbnail_pattern: "",
#         rotate: '0'
#       }
#     )
#   end
# end
