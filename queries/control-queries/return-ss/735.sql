select count(ss.ss_item_sk)
from store_sales ss,customer c,store_returns sr,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 191 and ss.ss_hash <= 941 and c.c_hash >= 436 and c.c_hash <= 836 and hd.hd_hash >= 498 and hd.hd_hash <= 831
;
