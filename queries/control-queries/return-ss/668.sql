select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,store_returns sr,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 422 and hd.hd_hash <= 822 and c.c_hash >= 525 and c.c_hash <= 858 and cd.cd_hash >= 55 and cd.cd_hash <= 805
;
