select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,store_returns sr,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 521 and ss.ss_hash <= 921 and cd.cd_hash >= 542 and cd.cd_hash <= 875 and hd.hd_hash >= 58 and hd.hd_hash <= 808
;
