select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,store_returns sr,customer_demographics cd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 66 and ss.ss_hash <= 816 and cd.cd_hash >= 138 and cd.cd_hash <= 471 and d.d_hash >= 381 and d.d_hash <= 781
;
