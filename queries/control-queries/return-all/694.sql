select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,customer_demographics cd,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 15 and ss.ss_hash <= 765 and c.c_hash >= 14 and c.c_hash <= 414 and hd.hd_hash >= 325 and hd.hd_hash <= 658
;
