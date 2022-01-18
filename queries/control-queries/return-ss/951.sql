select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,store_returns sr,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and hd.hd_hash >= 62 and hd.hd_hash <= 812 and cd.cd_hash >= 421 and cd.cd_hash <= 754 and d.d_hash >= 364 and d.d_hash <= 764
;
