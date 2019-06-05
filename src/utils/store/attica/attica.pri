#ANDROID_EXTRA_LIBS += $$PWD/poppler/libfreetype.so
ANDROID_EXTRA_LIBS += $$PWD/libKF5Attica.so

unix:!macx: LIBS += -L$$PWD/./ -lKF5Attica

INCLUDEPATH += $$PWD/headers
DEPENDPATH += $$PWD/headers

#unix:!macx: LIBS += -lfreetype

#unix:!macx|win32: LIBS += -lfreetype


#QT += core network

#HEADERS += \
#        $$PWD/attica/src/accountbalance.h \
#        $$PWD/attica/src/accountbalanceparser.h \
#        $$PWD/attica/src/achievement.h \
#        $$PWD/attica/src/achievementparser.h \
#        $$PWD/attica/src/buildservice.h \
#        $$PWD/attica/src/buildserviceparser.h \
#        $$PWD/attica/src/buildservicejob.h \
#        $$PWD/attica/src/buildservicejobparser.h \
#        $$PWD/attica/src/buildservicejoboutput.h \
#        $$PWD/attica/src/buildservicejoboutputparser.h \
#        $$PWD/attica/src/activity.h \
#        $$PWD/attica/src/activityparser.h \
#        $$PWD/attica/src/atticabasejob.h \
#        $$PWD/attica/src/atticautils.h \
#        $$PWD/attica/src/privatedata.h \
#        $$PWD/attica/src/privatedataparser.h \
#        $$PWD/attica/src/category.h \
#        $$PWD/attica/src/categoryparser.h \
#        $$PWD/attica/src/comment.h \
#        $$PWD/attica/src/commentparser.h \
#        $$PWD/attica/src/config.h \
#        $$PWD/attica/src/configparser.h \
#        $$PWD/attica/src/content.h \
#        $$PWD/attica/src/contentparser.h \
#        $$PWD/attica/src/deletejob.h \
#        $$PWD/attica/src/distribution.h \
#        $$PWD/attica/src/distributionparser.h \
#        $$PWD/attica/src/downloaddescription.h \
#        $$PWD/attica/src/downloaditem.h \
#        $$PWD/attica/src/downloaditemparser.h \
#        $$PWD/attica/src/event.h \
#        $$PWD/attica/src/eventparser.h \
#        $$PWD/attica/src/folder.h \
#        $$PWD/attica/src/folderparser.h \
#        $$PWD/attica/src/forum.h \
#        $$PWD/attica/src/forumparser.h \
#        $$PWD/attica/src/getjob.h \
#        $$PWD/attica/src/homepageentry.h \
#        $$PWD/attica/src/homepagetype.h \
#        $$PWD/attica/src/homepagetypeparser.h \
#        $$PWD/attica/src/icon.h \
#        $$PWD/attica/src/itemjob.h \
#        $$PWD/attica/src/knowledgebaseentry.h \
#        $$PWD/attica/src/knowledgebaseentryparser.h \
#        $$PWD/attica/src/license.h \
#        $$PWD/attica/src/licenseparser.h \
#        $$PWD/attica/src/listjob_inst.h \
#        $$PWD/attica/src/message.h \
#        $$PWD/attica/src/messageparser.h \
#        $$PWD/attica/src/metadata.h \
#        $$PWD/attica/src/parser.h \
#        $$PWD/attica/src/person.h \
#        $$PWD/attica/src/personparser.h \
#        $$PWD/attica/src/platformdependent_v2.h \
#        $$PWD/attica/src/postfiledata.h \
#        $$PWD/attica/src/postjob.h \
#        $$PWD/attica/src/project.h \
#        $$PWD/attica/src/projectparser.h \
#        $$PWD/attica/src/putjob.h \
#        $$PWD/attica/src/remoteaccount.h \
#        $$PWD/attica/src/remoteaccountparser.h \
#        $$PWD/attica/src/provider.h \
#        $$PWD/attica/src/providermanager.h \
#        $$PWD/attica/src/publisher.h \
#        $$PWD/attica/src/publisherparser.h \
#        $$PWD/attica/src/publisherfield.h \
#        $$PWD/attica/src/publisherfieldparser.h \
#        $$PWD/attica/src/qtplatformdependent.h \
#        $$PWD/attica/src/topic.h \
#        $$PWD/attica/src/topicparser.h \

#SOURCES += \
#        $$PWD/attica/src/accountbalance.cpp \
#        $$PWD/attica/src/accountbalanceparser.cpp \
#        $$PWD/attica/src/achievement.cpp \
#        $$PWD/attica/src/achievementparser.cpp \
#        $$PWD/attica/src/buildservice.cpp \
#        $$PWD/attica/src/buildserviceparser.cpp \
#        $$PWD/attica/src/buildservicejob.cpp \
#        $$PWD/attica/src/buildservicejobparser.cpp \
#        $$PWD/attica/src/buildservicejoboutput.cpp \
#        $$PWD/attica/src/buildservicejoboutputparser.cpp \
#        $$PWD/attica/src/activity.cpp \
#        $$PWD/attica/src/activityparser.cpp \
#        $$PWD/attica/src/atticabasejob.cpp \
#        $$PWD/attica/src/atticautils.cpp \
#        $$PWD/attica/src/privatedata.cpp \
#        $$PWD/attica/src/privatedataparser.cpp \
#        $$PWD/attica/src/category.cpp \
#        $$PWD/attica/src/categoryparser.cpp \
#        $$PWD/attica/src/comment.cpp \
#        $$PWD/attica/src/commentparser.cpp \
#        $$PWD/attica/src/config.cpp \
#        $$PWD/attica/src/configparser.cpp \
#        $$PWD/attica/src/content.cpp \
#        $$PWD/attica/src/contentparser.cpp \
#        $$PWD/attica/src/deletejob.cpp \
#        $$PWD/attica/src/distribution.cpp \
#        $$PWD/attica/src/distributionparser.cpp \
#        $$PWD/attica/src/downloaddescription.cpp \
#        $$PWD/attica/src/downloaditem.cpp \
#        $$PWD/attica/src/downloaditemparser.cpp \
#        $$PWD/attica/src/event.cpp \
#        $$PWD/attica/src/eventparser.cpp \
#        $$PWD/attica/src/folder.cpp \
#        $$PWD/attica/src/folderparser.cpp \
#        $$PWD/attica/src/forum.cpp \
#        $$PWD/attica/src/forumparser.cpp \
#        $$PWD/attica/src/getjob.cpp \
#        $$PWD/attica/src/homepageentry.cpp \
#        $$PWD/attica/src/homepagetype.cpp \
#        $$PWD/attica/src/homepagetypeparser.cpp \
#        $$PWD/attica/src/icon.cpp \
#        $$PWD/attica/src/itemjob.cpp \
#        $$PWD/attica/src/knowledgebaseentry.cpp \
#        $$PWD/attica/src/knowledgebaseentryparser.cpp \
#        $$PWD/attica/src/license.cpp \
#        $$PWD/attica/src/licenseparser.cpp \
#        $$PWD/attica/src/listjob_inst.cpp \
#        $$PWD/attica/src/message.cpp \
#        $$PWD/attica/src/messageparser.cpp \
#        $$PWD/attica/src/metadata.cpp \
#        $$PWD/attica/src/parser.cpp \
#        $$PWD/attica/src/person.cpp \
#        $$PWD/attica/src/personparser.cpp \
#        $$PWD/attica/src/platformdependent_v2.cpp \
#        $$PWD/attica/src/postfiledata.cpp \
#        $$PWD/attica/src/postjob.cpp \
#        $$PWD/attica/src/project.cpp \
#        $$PWD/attica/src/projectparser.cpp \
#        $$PWD/attica/src/putjob.cpp \
#        $$PWD/attica/src/remoteaccount.cpp \
#        $$PWD/attica/src/remoteaccountparser.cpp \
#        $$PWD/attica/src/provider.cpp \
#        $$PWD/attica/src/providermanager.cpp \
#        $$PWD/attica/src/publisher.cpp \
#        $$PWD/attica/src/publisherparser.cpp \
#        $$PWD/attica/src/publisherfield.cpp \
#        $$PWD/attica/src/publisherfieldparser.cpp \
#        $$PWD/attica/src/qtplatformdependent.cpp \
#        $$PWD/attica/src/topic.cpp \
#        $$PWD/attica/src/topicparser.cpp \
	
#DEPENDPATH += \
#    $$PWD/attica/src \

#INCLUDEPATH += \
#     $$PWD/attica/src  \


