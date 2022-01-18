select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,customer_demographics cd,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 226 and ss.ss_hash <= 626 and cd.cd_hash >= 188 and cd.cd_hash <= 938 and c.c_hash >= 217 and c.c_hash <= 550
;
