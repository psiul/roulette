select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,household_demographics hd,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 368 and ss.ss_hash <= 768 and hd.hd_hash >= 343 and hd.hd_hash <= 676 and cd.cd_hash >= 43 and cd.cd_hash <= 793
;
