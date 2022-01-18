select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c,store_returns sr
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 200 and ss.ss_hash <= 600 and hd.hd_hash >= 30 and hd.hd_hash <= 780 and c.c_hash >= 34 and c.c_hash <= 367
;
