select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,item i,store_returns sr
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and cd.cd_hash >= 373 and cd.cd_hash <= 773 and hd.hd_hash >= 58 and hd.hd_hash <= 808 and i.i_hash >= 531 and i.i_hash <= 864
;
