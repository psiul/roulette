select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,store_returns sr,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 25 and ss.ss_hash <= 358 and cd.cd_hash >= 237 and cd.cd_hash <= 987 and d.d_hash >= 237 and d.d_hash <= 637
;
