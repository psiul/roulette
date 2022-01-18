select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,customer_demographics cd,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 86 and ss.ss_hash <= 836 and hd.hd_hash >= 599 and hd.hd_hash <= 999 and cd.cd_hash >= 389 and cd.cd_hash <= 722
;
