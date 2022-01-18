select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i,store_returns sr
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 8 and ss.ss_hash <= 408 and cd.cd_hash >= 589 and cd.cd_hash <= 922 and i.i_hash >= 43 and i.i_hash <= 793
;
