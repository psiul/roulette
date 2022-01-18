select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,store_returns sr
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 327 and ss.ss_hash <= 727 and cd.cd_hash >= 97 and cd.cd_hash <= 847 and c.c_hash >= 126 and c.c_hash <= 459
;
