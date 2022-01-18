select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,date_dim d,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and sr.sr_returned_date_sk = d.d_date_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 155 and ss.ss_hash <= 488 and cd.cd_hash >= 542 and cd.cd_hash <= 942 and hd.hd_hash >= 234 and hd.hd_hash <= 984
;
