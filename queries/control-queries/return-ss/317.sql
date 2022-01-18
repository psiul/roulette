select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,store_returns sr
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and c.c_hash >= 609 and c.c_hash <= 942 and cd.cd_hash >= 225 and cd.cd_hash <= 975 and hd.hd_hash >= 531 and hd.hd_hash <= 931
;
