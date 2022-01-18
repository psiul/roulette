select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,store_returns sr
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 74 and ss.ss_hash <= 824 and cd.cd_hash >= 586 and cd.cd_hash <= 919 and hd.hd_hash >= 174 and hd.hd_hash <= 574
;
