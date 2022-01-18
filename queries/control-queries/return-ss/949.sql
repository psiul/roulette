select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,store_returns sr,household_demographics hd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 666 and ss.ss_hash <= 999 and cd.cd_hash >= 237 and cd.cd_hash <= 987 and hd.hd_hash >= 476 and hd.hd_hash <= 876
;
