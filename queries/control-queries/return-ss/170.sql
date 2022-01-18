select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,customer c,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and sr.sr_customer_sk = c.c_customer_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 483 and ss.ss_hash <= 883 and c.c_hash >= 197 and c.c_hash <= 947 and cd.cd_hash >= 326 and cd.cd_hash <= 659
;
