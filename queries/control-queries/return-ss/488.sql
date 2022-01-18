select count(ss.ss_item_sk)
from store_sales ss,customer c,store_returns sr,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and c.c_current_hdemo_sk = hd.hd_demo_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 87 and ss.ss_hash <= 420 and c.c_hash >= 84 and c.c_hash <= 834 and cd.cd_hash >= 191 and cd.cd_hash <= 591
;
