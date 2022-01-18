select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,store_returns sr,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 388 and ss.ss_hash <= 788 and hd.hd_hash >= 121 and hd.hd_hash <= 871 and c.c_hash >= 226 and c.c_hash <= 559
;
