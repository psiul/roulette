select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 43 and ss.ss_hash <= 793 and hd.hd_hash >= 242 and hd.hd_hash <= 642 and cd.cd_hash >= 168 and cd.cd_hash <= 501
;
