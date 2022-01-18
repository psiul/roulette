select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,household_demographics hd,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 94 and ss.ss_hash <= 844 and hd.hd_hash >= 93 and hd.hd_hash <= 493 and c.c_hash >= 323 and c.c_hash <= 656
;
