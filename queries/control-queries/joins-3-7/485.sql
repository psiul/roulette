select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 92 and ss.ss_hash <= 842 and i.i_hash >= 168 and i.i_hash <= 501 and cd.cd_hash >= 447 and cd.cd_hash <= 847
;
