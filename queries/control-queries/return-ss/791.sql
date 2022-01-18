select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,household_demographics hd,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 63 and ss.ss_hash <= 396 and c.c_hash >= 211 and c.c_hash <= 961 and cd.cd_hash >= 454 and cd.cd_hash <= 854
;
