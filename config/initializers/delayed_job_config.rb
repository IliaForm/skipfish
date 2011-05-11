 silence_warnings do
   Delayed::Job.const_set("MAX_RUN_TIME", 1.week)
 end