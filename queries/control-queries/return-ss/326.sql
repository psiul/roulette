select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,store_returns sr,customer_demographics cd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 111 and ss.ss_hash <= 444 and cd.cd_hash >= 21 and cd.cd_hash <= 421 and c.c_hash >= 129 and c.c_hash <= 879
;
