select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,store_returns sr,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 317 and ss.ss_hash <= 650 and cd.cd_hash >= 31 and cd.cd_hash <= 781 and d.d_hash >= 331 and d.d_hash <= 731
;
