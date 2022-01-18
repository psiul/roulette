select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,store_returns sr,customer_demographics cd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and sr.sr_returned_date_sk = d.d_date_sk and hd.hd_hash >= 162 and hd.hd_hash <= 912 and cd.cd_hash >= 417 and cd.cd_hash <= 750 and d.d_hash >= 183 and d.d_hash <= 583
;
