select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,household_demographics hd,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 125 and ss.ss_hash <= 525 and hd.hd_hash >= 125 and hd.hd_hash <= 458 and cd.cd_hash >= 248 and cd.cd_hash <= 998
;
