select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,store_returns sr,household_demographics hd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 340 and ss.ss_hash <= 673 and cd.cd_hash >= 221 and cd.cd_hash <= 971 and c.c_hash >= 487 and c.c_hash <= 887
;
