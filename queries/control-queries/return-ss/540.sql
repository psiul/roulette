select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,household_demographics hd,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 167 and ss.ss_hash <= 917 and hd.hd_hash >= 148 and hd.hd_hash <= 548 and c.c_hash >= 188 and c.c_hash <= 521
;
