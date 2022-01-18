select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,store_returns sr,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 238 and ss.ss_hash <= 638 and cd.cd_hash >= 591 and cd.cd_hash <= 924 and hd.hd_hash >= 247 and hd.hd_hash <= 997
;
