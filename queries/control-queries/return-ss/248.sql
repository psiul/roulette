select count(ss.ss_item_sk)
from store_sales ss,customer c,store_returns sr,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 195 and ss.ss_hash <= 945 and c.c_hash >= 294 and c.c_hash <= 694 and cd.cd_hash >= 431 and cd.cd_hash <= 764
;
