select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,customer_demographics cd,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 137 and ss.ss_hash <= 537 and c.c_hash >= 20 and c.c_hash <= 770 and cd.cd_hash >= 118 and cd.cd_hash <= 451
;
