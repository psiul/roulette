select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,store_returns sr,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 271 and ss.ss_hash <= 671 and hd.hd_hash >= 417 and hd.hd_hash <= 750 and cd.cd_hash >= 215 and cd.cd_hash <= 965
;
