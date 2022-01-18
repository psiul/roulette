select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,store_returns sr,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 162 and ss.ss_hash <= 495 and cd.cd_hash >= 71 and cd.cd_hash <= 471 and hd.hd_hash >= 97 and hd.hd_hash <= 847
;
