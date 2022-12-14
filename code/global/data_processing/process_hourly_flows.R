# *****************************************************************************
# DESCRIPTION
# *****************************************************************************
# This script is run by global.R, so df's are globally accessible
# It processes the hourly time series data
# *****************************************************************************
# INPUTS
# *****************************************************************************
# flows_rt_long_cfs_df - table with real-time flows created by import.R
# *****************************************************************************
# OUTPUTS
# *****************************************************************************
# flows.hourly.cfs.df
# *****************************************************************************

# Add 3 days of rows with added flow values = NA-------------------------------
#   (revisit - not sure if this is necessary or why it's being done)
last_hour <- tail(flows.hourly.cfs.df0$date_time, 1)
last_hour <- last_hour + lubridate::hours(1)
flows.hourly.cfs.df <- flows.hourly.cfs.df0 %>%
  add_row(date_time = seq.POSIXt(last_hour, length.out = 72, by = "hour"))
# this is a temp fix, because Find is not working
flows_rt_cfs_df <- flows.hourly.cfs.df