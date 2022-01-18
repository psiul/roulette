select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,customer c,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 103 and ss.ss_hash <= 503 and c.c_hash >= 642 and c.c_hash <= 975 and hd.hd_hash >= 154 and hd.hd_hash <= 904
;
