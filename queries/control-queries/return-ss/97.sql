select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,customer_demographics cd,date_dim d
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 560 and ss.ss_hash <= 960 and cd.cd_hash >= 86 and cd.cd_hash <= 836 and d.d_hash >= 283 and d.d_hash <= 616
;
