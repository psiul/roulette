select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,customer_demographics cd,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 516 and ss.ss_hash <= 849 and hd.hd_hash >= 549 and hd.hd_hash <= 949 and cd.cd_hash >= 43 and cd.cd_hash <= 793
;
