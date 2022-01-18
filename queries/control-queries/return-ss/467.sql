select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,customer c,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and sr.sr_customer_sk = c.c_customer_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 410 and ss.ss_hash <= 810 and hd.hd_hash >= 412 and hd.hd_hash <= 745 and c.c_hash >= 30 and c.c_hash <= 780
;
