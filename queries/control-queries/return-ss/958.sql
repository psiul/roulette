select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,customer_demographics cd,date_dim d
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 198 and ss.ss_hash <= 531 and hd.hd_hash >= 43 and hd.hd_hash <= 793 and d.d_hash >= 440 and d.d_hash <= 840
;
