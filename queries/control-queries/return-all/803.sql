select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,store_returns sr,customer_demographics cd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 94 and ss.ss_hash <= 844 and hd.hd_hash >= 59 and hd.hd_hash <= 459 and cd.cd_hash >= 158 and cd.cd_hash <= 491
;
