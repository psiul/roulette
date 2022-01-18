select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and sr.sr_returned_date_sk = d.d_date_sk and cd.cd_hash >= 481 and cd.cd_hash <= 814 and hd.hd_hash >= 234 and hd.hd_hash <= 984 and d.d_hash >= 125 and d.d_hash <= 525
;
